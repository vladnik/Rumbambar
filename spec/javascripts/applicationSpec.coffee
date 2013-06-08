describe "Application helpers", ->
  describe "asset_path", ->
    it "returns correct asset path for file", ->
      expect(asset_path('image.png')).toEqual('/assets/image.png')

  describe "rumba_path", ->
    it "returns correct path", ->
      expect(rumba_path('model')).toEqual('/rumba/model')

  describe "toSnake", ->
    it "converts CamelCase string to snake_case", ->
      expect('CamelCase'.toSnake()).toEqual('camel_case')

  describe "toTitle", ->
    it "converts CamelCase string to title", ->
      expect('CamelCase'.toTitle()).toEqual('Camel Case')
    it "converts snake_case string to title", ->
      expect('snake_case'.toTitle()).toEqual('Snake Case')