@Clock = React.createClass
  getInitialState: ->
    time: @getTime()
  getTime: ->
    date = new Date()
    hours: @leftPad(date.getHours())
    minutes: @leftPad(date.getMinutes())
    seconds: @leftPad(date.getSeconds())
  leftPad: (num) ->
    if num < 10
      "0#{num}"
    else
      num.toString()
  setTime: () ->
    @setState(time: @getTime())
  componentDidMount: ->
    setInterval @setTime, 1000
  render: ->
    <div className='clock'>
      <span className='clock__value'>
        { @state.time.hours }
      </span>
      <span className='clock__value'>
        { @state.time.minutes }
      </span>
      <span className='clock__value'>
        { @state.time.seconds }
      </span>
    </div>
