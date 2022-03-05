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
          creditCardName TEXT
        )
    ''',
  3: '''
          INSERT INTO statements (id, cardName_id, price, note) VALUES
          ('defaultid', '「カード別」からクレジットカードを追加してください', 0, '文字はスクロールできます。左右どちらかにスワイプで削除します。')
      ''',
  // 4: '''
  //         INSERT INTO cardName (id, creditCardName) VALUES
  //         ('defaultid_cardName', 'JCB card W')
  //     ''',
};
