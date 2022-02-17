Map<int, String> migrationScripts = {
  1: '''
        CREATE TABLE statements(
          id TEXT PRIMARY KEY , 
          cardName_id TEXT, 
          price INTEGER, 
          note TEXT
        )
    ''',
  2: '''
        CREATE TABLE cardName(
          id TEXT PRIMARY KEY, 
          name TEXT
        )
    ''',
  3: '''
          INSERT INTO statements (id, cardName_id, price, note) VALUES
          ('defaultid', 'ここにカード名が表示されるよ', 0, '左右どちらかにスワイプで削除します')
      ''',
};
