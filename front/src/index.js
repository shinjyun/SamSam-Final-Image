import React from 'react';

import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

// root라는 id를 가진 DOM 요소를 선택하여 애플리케이션을 렌더링할 루트 컨테이너로 사용됨
const root = ReactDOM.createRoot(document.getElementById('root'));

// 루트컨테이너에 React 컴포넌트를 렌더링함
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// 애플리케이션의 성능을 측정하기 위한 함수 호출
reportWebVitals();
