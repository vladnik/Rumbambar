describe "Rumba helpers", ->
  beforeEach ->
    Rumba.init(asset_path: '/asset_path/', namespace: '/rumba_path/', models: [])

  describe "asset_path", ->
    it "returns correct asset path for file", ->
      expect(Rumba.asset_path('image.png')).toEqual('/asset_path/image.png')

  describe "path", ->
    it "returns correct path", ->
      expect(Rumba.path('model')).toEqual('/rumba_path/model')

  describe "add_route", ->
    it "adds routes for application", ->
      #expect(Rumba.add_route('some_route')).toEqual(['some_route'])

  describe "add_resource_routes", ->
    it "create all routes for resource", ->
      spyOn(Rumba, 'add_route')
      Rumba.add_resource_routes('Model')
      expect(Rumba.add_route).toHaveBeenCalledWith
        path : '/rumba_path/model'
        template : '/asset_path/rumbambar/index.html'
        controller : 'ModelCtrl'
      expect(Rumba.add_route).toHaveBeenCalledWith
        path : '/rumba_path/model/:id'
        template : '/asset_path/rumbambar/show.html'
        controller : 'ModelDetailCtrl'
      expect(Rumba.add_route).toHaveBeenCalledWith
        path : '/rumba_path/model/new'
        template : '/asset_path/rumbambar/edit.html'
        controller : 'ModelDetailCtrl'
      expect(Rumba.add_route).toHaveBeenCalledWith
        path : '/rumba_path/model/:id/edit'
        template : '/asset_path/rumbambar/edit.html'
        controller : 'ModelDetailCtrl'