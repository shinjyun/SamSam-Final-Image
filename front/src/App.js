//import logo from './logo.svg';
import Img from './imgreact/Img';
import './App.css';

// App 컴포넌트를 정의하며 애플리케이션의 주요 UI 구성
function App() {
	// JSX를 반환하며 React 컴포넌트의 UI 구조를 정의하는데 사용됨
  return (
    <div className="App">
      <Img />
    </div>
  );
}

// App 컴포넌트를 기본 내보내기로 내보내며 다른 파일에서 App 컴포넌트를 임포트할 수 있음
export default App;


