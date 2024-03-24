class ApiPath {
  ApiPath._();

  static const auth = "/auth";
  static const updateProfile = '/user/profile';
  static const getJobs = '/job';
  static const bid = '/bid';
  static const createJob = '/job';

  static detailJob(int jobId) => '/job/$jobId';

  static acceptBid(int bidId) => '/bid/$bidId/accept';
}
