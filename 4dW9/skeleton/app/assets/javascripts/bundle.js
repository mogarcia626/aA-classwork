/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

class FollowToggle {
    constructor (obj) {
        let $obj = $(obj);
        this.user_id = $obj.data('user-id');
        this.state = $obj.data('initial-follow-state');
        this.$obj = $obj;
        this.render();
        this.$obj.click( (e) => {
            e.preventDefault()
            this.handleClick();
        })
    }

    render () {
        let text = (this.state) ? 'Unfollow' : 'Follow'
        this.$obj.text(text)

    } 

    handleClick () {
        // debugger
        $.ajax({
            url: `/users/${this.user_id}/follow`,
            type: this.state ? 'DELETE' : 'POST',
            success: () => {
                this.state = this.state ? false : true;
                this.render();
            },
            dataType: 'json'
        })
        
    }
}

module.exports = FollowToggle

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js")

$(() => {
    $('.follow-toggle').each((idx, button) => {
        const a = new FollowToggle(button);
    })
    
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map