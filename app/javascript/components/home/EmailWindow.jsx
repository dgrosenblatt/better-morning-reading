import React, { useState } from 'react'
import PrideAndPrejudice from './PrideAndPrejudice'
import HuckFinn from './HuckFinn'
import Gatsby from './Gatsby';

const EmailListItem = ({ id, activeEmailId, setActiveEmailId, children }) => {
  const className = id === activeEmailId ? 'email-list-item active' : 'email-list-item'
  const onClick = () => { setActiveEmailId(id) }

  return (
    <button className={className} onClick={onClick}>
      {children}
    </button>
  )
}

function htmlDecode(input) {
  var doc = new DOMParser().parseFromString(input, "text/html");
  return doc.documentElement.textContent;
}

const EmailReadingPane = ({ activeEmailId }) => {
  const content = {
    1: <PrideAndPrejudice coverUrl={htmlDecode(window.prideCoverUrl)} />,
    2: <Gatsby coverUrl={htmlDecode(window.gatsbyCoverUrl)} />,
    3: <HuckFinn coverUrl={htmlDecode(window.huckCoverUrl)} />
  }
  return content[activeEmailId]
}

const EmailWindow = () => {
  let [activeEmailId, setActiveEmailId] = useState(1)
  return (
    <div className="email-window">
      <div className="top-bar"></div>
      <div className="email-window-content">
        <div className="email-message-list">
          <EmailListItem
            key={1}
            id={1}
            activeEmailId={activeEmailId}
            setActiveEmailId={setActiveEmailId}
          >
            <h4>Better Morning Reading</h4>
            <p>Pride and Prejudice | Chapter 1</p>
          </EmailListItem>
          <EmailListItem
            key={2}
            id={2}
            activeEmailId={activeEmailId}
            setActiveEmailId={setActiveEmailId}
          >
            <h4>Literature instead of likes</h4>
            <p>Book chapters delivered to your email daily or on your schedule</p>
          </EmailListItem>
          <EmailListItem
            key={3}
            id={3}
            activeEmailId={activeEmailId}
            setActiveEmailId={setActiveEmailId}
          >
            <h4>Organize a club or read solo</h4>
            <p>Choose from our collection of classics for your next book club </p>
          </EmailListItem>
        </div>
        <div className="email-reading-pane">
          <EmailReadingPane activeEmailId={activeEmailId} />
        </div>
      </div>
    </div>
  )
}

export default EmailWindow
