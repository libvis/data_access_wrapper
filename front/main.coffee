import React from 'react'
import './style.css'

export default Presenter = ({data, setattr}) =>
  if data is undefined
    return "Loading..."
  <div className="data_access_wrapper-presenter">
    Random quote: `<p>{data.quote}</p>`
  </div>
