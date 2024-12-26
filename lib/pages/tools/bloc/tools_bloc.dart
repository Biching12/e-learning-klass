import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tools_event.dart';
part 'tools_state.dart';

class ToolsBloc extends Bloc<ToolsEvent, ToolsState> {
  ToolsBloc() : super(ToolsInitial()) {
    on<ToolsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
