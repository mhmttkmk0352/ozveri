<script crossorigin src="https://unpkg.com/react@17/umd/react.development.js"></script>
<script crossorigin src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>

<script>
class Test extends React.Component {
  render() {
    return "<h1>Hello World!</h1>";
  }
}

ReactDOM.render("<Test />", document.getElementById('root'));
</script>

<div id="root"></div>
