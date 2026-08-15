import Sidebar from './Sidebar.jsx'

function AppLayout({ children }) {
  return (
    <div className="app-layout">
      <Sidebar />
      <div className="app-content">{children}</div>
    </div>
  )
}

export default AppLayout
