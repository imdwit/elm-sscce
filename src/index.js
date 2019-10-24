import './main.css';
import { Elm } from './Main.elm';

const app = Elm.Main.init({
  node: document.getElementById('root'),
});

app.ports.teamsOut.subscribe(_ => {
  console.log('teamsOut called');
  app.ports.teamsIn.send('i am only an egg');
});
