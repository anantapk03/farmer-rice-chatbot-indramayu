import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/model/list_club_model.dart';

abstract class ListClubState {}

class ListClubStateSuccess extends ListClubState {
  final ListClubModel? listClubModel;
  ListClubStateSuccess(this.listClubModel);
}

class ListClubStateLoading extends ListClubState {}

class ListClubStateError extends ListClubState {}

class ListClubStateIdle extends ListClubState {}
