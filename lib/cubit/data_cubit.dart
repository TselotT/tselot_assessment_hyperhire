import 'dart:async';

import 'package:assessment/model/data_model.dart';
import 'package:assessment/repo/firebase_realtime_database_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  final FirebaseRealtimeDatabaseRepo _firebaseRealtimeDatabaseRepo;
  DataCubit(this._firebaseRealtimeDatabaseRepo) : super(DataInitial()) {
    transformData().listen((event) {
      data.clear();
      data.addAll(event);
      emit(DataLoaded(data));
    });
  }
  StreamSubscription<List<DataModel>>? _streamSubscription;

  final List<DataModel> data = [];

  dismissData(DataModel dataModel) {
    data.remove(dataModel);
    emit(DataLoaded(data));
  }

  Stream<List<DataModel>> transformData() {
    Stream<DatabaseEvent> stream = _firebaseRealtimeDatabaseRepo.listenToData();
    return stream
        .transform(StreamTransformer.fromHandlers(handleData: (event, sink) {
      List<DataModel> data = [];
      (event.snapshot.value as Map).forEach((key, value) {
        data.add(DataModel.fromJson(Map<String, dynamic>.from(value), key));
      });
      sink.add(data);
    }));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
