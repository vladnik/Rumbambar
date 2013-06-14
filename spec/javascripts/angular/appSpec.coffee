describe "Global helpers", ->

  describe "toSnake", ->
    it "converts CamelCase string to snake_case", ->
      expect('CamelCase'.toSnake()).toEqual('camel_case')

  describe "toTitle", ->
    it "converts CamelCase string to title", ->
      expect('CamelCase'.toTitle()).toEqual('Camel Case')
    it "converts snake_case string to title", ->
      expect('snake_case'.toTitle()).toEqual('Snake Case')

describe "Application", ->
  it "Should be defined", ->
    expect(angular.module('rumba')).toBeDefined()
