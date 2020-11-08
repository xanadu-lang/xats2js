/* ****** ****** */

const
readline =
require('readline');
const rl =
readline.createInterface
(
{
  input: process.stdin,
}
);

/* ****** ****** */

rl.on
( 'line',
  (line) => {
      myline_process(line);
  }
);

rl.on
( 'close',
  () => {
      console.log("[readline] is closed!");
      process.exit(0);
  }
);

/* ****** ****** */

/* end of [readline.cats] */