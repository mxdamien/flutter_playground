abstract class UserDetailEvent {
  const UserDetailEvent();
}

class FetchUserDetail extends UserDetailEvent {
  final int userId;

  const FetchUserDetail(this.userId);
}
