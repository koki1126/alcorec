Map<int, String> migrationScripts = {
  1: '''
          CREATE TABLE member (
            _id INTEGER PRIMARY KEY,
            member_name TEXT NOT NULL
          )
      ''',
  2: '''
          CREATE TABLE liquor (
            _id INTEGER PRIMARY KEY,
            liquor_name TEXT NOT NULL
          )
      ''',
};
