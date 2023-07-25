import 'package:flutter_note_app/doamin/repository/title_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@Singleton(as: TitleRepository)
class MockTitleRepositoyImpl implements TitleRepository {
  @override
  String getTitle() {
    return '메모 앱 (개발용)';
  }
}
