angular.module('app').controller 'select2Controller'
, ['$scope'
, ($scope) ->

  $scope.sources = [
    {
      id: '1'
      description: 'Option 1'
    },
    {
      id: '2'
      description: 'Option 2'
    },
    {
      id: '3'
      description: 'Option 3'
    }
  ]

  $scope.tagsSelection = [ '1', '2' ]
    
  $scope.tagAllOptions = new Select2Tagging($scope.sources, 'description')
    
  $scope.updateVal = () ->
    $scope.tagsSelection = [
      {
        id:"3"
        description:"Option 3"
      }
    ]
]


# "class" for customizing select2
#(with possibility to create selection items on the fly
Select2Tagging = (items,formatProperty) ->
  if not formatProperty
    formatProperty = "text"
    
  console.log "Select2Tagging init"
  
  f = {}
  f.formatProperty = formatProperty
  
  f.data = items
  
  itemMap = {}
  $.each(items,(index,value)->
    itemMap[value.id] = value
  )
    
  f.initSelection = (element, callback) ->
    data = []
    eleVal = element.val()
    console.log "initSelection " + eleVal
    ids = eleVal.split ","
    $(ids).each(() ->
      id = this
      $(f.data).each(() ->
        if id.localeCompare(""+this.id) == 0
          data.push this
      )
    )
    callback data
    
  f.createSearchChoice = (term, data) ->
    matchedItems = $(data).filter () ->
      this[f.formatProperty].localeCompare(term) is 0
    
    if matchedItems.length is 0
      result =
        id: term,
      
      result[f.formatProperty] = term
      result

  formatResult = (item) ->
    if item[f.formatProperty]
      item[f.formatProperty]
    else
      item
    
  formatSelection = (item) ->
    if item[f.formatProperty]
      item[f.formatProperty]
    else
      item
    
  f.formatResult = formatResult
  f.formatSelection = formatSelection
  f.multiple = true
  f