function resizable1(el) {
  var getX = function getX(e) {
    return e.clientX || e.touches[0].clientX;
  };

  var togglePressed = function togglePressed(isActive) {
    return function (event) {
      if (state.pressed !== isActive) {
        state.pressed = isActive;
        handle.classList.toggle('resizable-handle-active');
        state.x = isActive ? getX(event) : -1;
      }
    };
  };

  var move = function move(event) {
    if (state.pressed) {
      var width = el.getBoundingClientRect().width;
      var clientX = getX(event);
      var direction = state.x < clientX ? 1 : -1;
      var diff = Math.abs(state.x - clientX) * direction;
      el.style.cssText += 'width: ' + (width + diff) + 'px;';
      state.x = clientX;
    }
  };

  var state = {
    pressed: false,
    x: -1
  };

  var handle = document.createElement('div');
  handle.classList.add('resizable-handle');
  handle.style.cssText += '\n    position: absolute;\n    right: 0;\n    top: 0;\n    height: 100%;\n  cursor: col-resize;\n  ';

  handle.addEventListener('mousedown', togglePressed(true));
  window.addEventListener('mouseup', togglePressed(false));
  window.addEventListener('mousemove', move);

  el.appendChild(handle);
}
function resizable2(el) {
    var getX = function getX(e) {
        return e.clientX || e.touches[0].clientX;
    };

    var togglePressed = function togglePressed(isActive) {
        return function (event) {
            if (state.pressed !== isActive) {
                state.pressed = isActive;
                handle.classList.toggle('resizable-handle-active');
                state.x = isActive ? getX(event) : -1;
            }
        };
    };

    var move = function move(event) {
        if (state.pressed) {
            var width = el.getBoundingClientRect().width;
            var clientX = getX(event);
            var direction = state.x < clientX ? 1 : -1;
            var diff = Math.abs(state.x - clientX) * direction;
            el.style.cssText += 'width: ' + (width + diff) + 'px;';
            state.x = clientX;
        }
    };

    var state = {
        pressed: false,
        x: -1
    };

    var handle = document.createElement('div');
    handle.classList.add('resizable-handle');
    handle.style.cssText += '\n    position: absolute;\n    right: 0;\n    top: 0;\n    height: 100%;\n    cursor: col-resize;\n  ';

    handle.addEventListener('mousedown', togglePressed(true));
    window.addEventListener('mouseup', togglePressed(false));
    window.addEventListener('mousemove', move);


    el.appendChild(handle);
}
function resizable3(el) {
    var getX = function getX(e) {
        return e.clientX || e.touches[0].clientX;
    };

    var togglePressed = function togglePressed(isActive) {
        return function (event) {
            if (state.pressed !== isActive) {
                state.pressed = isActive;
                handle.classList.toggle('resizable-handle-active');
                state.x = isActive ? getX(event) : -1;
            }
        };
    };

    var move = function move(event) {
        if (state.pressed) {
            var width = el.getBoundingClientRect().width;
            var clientX = getX(event);
            var direction = state.x < clientX ? 1 : -1;
            var diff = Math.abs(state.x - clientX) * direction;
            el.style.cssText += 'width: ' + (width + diff) + 'px;';
            state.x = clientX;
        }
    };

    var state = {
        pressed: false,
        x: -1
    };

    var handle = document.createElement('div');
    handle.classList.add('resizable-handle');
    handle.style.cssText += '\n    position: absolute;\n    right: 0;\n    top: 0;\n    height: 100%;\n    cursor: col-resize;\n  ';

    handle.addEventListener('mousedown', togglePressed(true));
    window.addEventListener('mouseup', togglePressed(false));
    window.addEventListener('mousemove', move);

    el.appendChild(handle);
}

var leftPanel1 = document.querySelector('.a2 .left');
var leftPanel2 = document.querySelector('.a3 .left');
var leftPanel3 = document.querySelector('.a6 .left');
resizable1(leftPanel1);
resizable2(leftPanel2);
resizable3(leftPanel3);
