import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:freelance/flutter_phantom/src/flutter_phantom.dart';
import 'package:freelance/models/wallet.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:solana_web3/solana_web3.dart' as web3;
import 'package:solana_web3/programs/system.dart';

class Phantom {
  Uri? _latestUri;
  late StreamSubscription sub;
  StreamController resultController = StreamController<dynamic>.broadcast();

  Stream get resultStream => resultController.stream;

  final FlutterPhantom phantom = FlutterPhantom(
    appUrl: "https://phantom.app",
    deepLink: "https://link-stg.kuuma.work/links/V9Hh",
  );
  late web3.Connection connection;

  Phantom._internal(); // Private constructor to prevent external instantiation

  static final Phantom _instance = Phantom._internal();

  void init() {
    final cluster = web3.Cluster.devnet;
    connection = web3.Connection(cluster);
    _handleIncomingLinks();
  }

  factory Phantom() {
    return _instance;
  }

  Future<void> _handleIncomingLinks() async {
    sub = uriLinkStream.listen((Uri? link) {
      _latestUri = link;
      final queryParams = _latestUri?.queryParametersAll.entries.toList();
      if (queryParams!.isNotEmpty) {
        switch (queryParams[0].value[0].toString()) {
          case "onConnect":
            Map dataConnect = phantom.onConnectToWallet(queryParams);
            resultController.add(["onConnect", dataConnect["public_key"]]);
            break;
          case "onSignAndSendTransaction":
            Map dataSignAndSendTransaction =
                phantom.onCreateSignAndSendTransactionReceive(queryParams);
            resultController.add(["onSignAndSendTransaction"]);
            break;
          case "onDisconnect":
            String dataDisconnect = phantom.onDisconnectReceive();
            print(dataDisconnect);
            break;
          case "onSignTransaction":
            web3.Transaction dataTransactionWithSign =
                phantom.onSignTransactionReceive(queryParams);
            print(dataTransactionWithSign);

            break;
          case "onSignAllTransaction":
            List<web3.Transaction> dataSignAllTransaction =
                phantom.onSignAllTransactionReceive(queryParams);
            print(dataSignAllTransaction);
            break;
          case "onSignMessage":
            Map dataOnSignMessage = phantom.onSignMessageReceive(queryParams);
            resultController.add([
              "onSignMessage",
              dataOnSignMessage["signature"],
              "hello from flutter"
            ]);

            break;
          default:
        }
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });
  }

  void connectToWallet() {
    try {
      Uri uri =
          phantom.generateConnectUri(cluster: "devnet", redirect: "onConnect");
      launchUrl(
        uri,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } catch (e) {
      rethrow;
    }
  }

  void signMessage() {
    try {
      final url = phantom.generateSignMessageUri(
          redirect: "onSignMessage", message: "hello from flutter");
      launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } catch (e) {
      rethrow;
    }
  }

  void signAndSendTransaction(String transactionString) async {
    try {
      final transDecode58 = web3.base64ToBase58(transactionString);
      final transDecode = web3.base58Decode(transDecode58);
      final transaction = web3.Transaction.fromList(transDecode);
      web3.Buffer transactionSerialize = transaction
          .serialize(const web3.SerializeConfig(requireAllSignatures: false));
      final url = phantom.generateSignAndSendTransactionUri(
          transaction: transactionSerialize,
          redirect: "onSignAndSendTransaction",
      );
      launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<web3.Transaction> createTransactionTransfer() async {
    final transaction = web3.Transaction(
        feePayer: phantom.phantomWalletPublicKey,
        recentBlockhash: (await connection.getLatestBlockhash()).blockhash);
    transaction.add(
      SystemProgram.transfer(
        fromPublicKey: phantom.phantomWalletPublicKey,
        toPublicKey: phantom.phantomWalletPublicKey,
        lamports: web3.solToLamports(1),
      ),
    );

    return transaction;
  }
}
