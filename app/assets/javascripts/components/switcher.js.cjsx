@Switcher = React.createClass
  getInitialState: ->
    index: 0
  showTab: (index) ->
    (e) =>
      @setState index: parseInt(index)
  currentItem: ->
    @props.items[@state.index]
  render: ->
    <div className='switcher'>
      <div className='switcher__panel'>
        { for own index, item of @props.items
          <button onClick={ @showTab(index) }>{ item.title }</button>
        }
      </div>
      <div className='switcher__container'>
        <h1>{ @currentItem().content }</h1>
      </div>
    </div>
