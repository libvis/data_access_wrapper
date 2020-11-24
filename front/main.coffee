import React from 'react'
import { LibvisModule } from 'libvis'
import './style.less'

open_json = (obj) =>
  json = JSON.stringify obj
  data = "data:text/json," + encodeURIComponent json
  console.log data
  tab = window.open 'text/json', "libvis data"
  tab.document.write(json)
  tab.document.close()

download_json = (obj) =>
  json = JSON.stringify obj
  a = document.createElement 'a'
  file = new Blob([json], type:'text/json')
  a.href = URL.createObjectURL(file)
  a.download = 'libvis_data.json'
  a.click()

export default Presenter = ({data, setattr, addr}) =>
  if data.body is undefined
    return "Loading..."
  <div className="data_access_wrapper-presenter"
    style={height: '100%', display: 'flex', flexDirection:'column'}
  >
    <div style={display: 'flex', flexDirection: 'row'}>
      <input
        type="button"
        className="btn"
        onClick={()=>open_json(data.body.value)}
        value='Open data in new tab'
      />
      <input
        type="button"
        className="btn"
        onClick={()=>download_json(data.body.value)}
        value='Save data'
      />
    </div>

    {LibvisModule(addr:addr, object:data.body)}
  </div>
