describe "Application", ->

  describe "toSnake", ->
    it "converts CamelCase string to snake_case", ->
      expect('CamelCase'.toSnake()).toEqual('camel_case')

  describe "toTitle", ->
    it "converts CamelCase string to title", ->
      expect('CamelCase'.toTitle()).toEqual('Camel Case')
    it "converts snake_case string to title", ->
      expect('snake_case'.toTitle()).toEqual('Snake Case')

describe "Rumba", ->
  beforeEach ->
    Rumba.init(asset_path: '/asset_path/', namespace: '/rumba_path/', models: [])

  describe "asset_path", ->
    it "returns correct asset path for file", ->
      expect(Rumba.asset_path('image.png')).toEqual('/asset_path/image.png')

  describe "path", ->
    it "returns correct path", ->
      expect(Rumba.path('model')).toEqual('/rumba_path/model')
