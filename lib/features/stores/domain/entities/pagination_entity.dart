// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaginationEntity {
  int currentPage;
  int totalPage;
  bool hasMorePage;
  PaginationEntity({
    required this.currentPage,
    required this.totalPage,
    required this.hasMorePage,
  });
}
