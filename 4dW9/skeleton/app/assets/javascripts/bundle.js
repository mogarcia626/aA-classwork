/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module) => {

const APIUtil = {
    followUser: id => {
        $.ajax({
            url: `/users/${id}/follow`,
            type: 'POST',
            dataType: 'json',
            async: false
        })
    },
  
    unfollowUser: id => {
        $.ajax({
            url: `/users/${id}/follow`,
            type: 'DELETE',
            dataType: 'json',
            async: false
        })
    },

    searchUsers: queryVal => {
        return $.ajax({
            url: `/users/search`,
            type: 'GET',
            data: {'query': queryVal},
            dataType: 'json',
            async: false
        })
    }
  };
  
module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const { unfollowUser, followUser } = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class FollowToggle {
    constructor (obj) {
        let $obj = $(obj);
        this.user_id = $obj.data('user-id');
        this.state = $obj.data('initial-follow-state');
        this.$obj = $obj;
        this.running = false
        this.render();
        this.$obj.click( (e) => {
            e.preventDefault()
            this.handleClick();
        })
    }

    render () {
        let text = (this.state) ? 'Unfollow' : 'Follow'
        this.$obj.text(text)
        if (this.running) {
            this.$obj.prop('disabled', true)
        } else {
            this.$obj.prop('disabled', false)
        }
    } 

    handleClick () {
        console.log("clicked")
        // debugger
        // $.ajax({
        //     url: `/users/${this.user_id}/follow`,
        //     type: this.state ? 'DELETE' : 'POST',
        //     success: () => {
        //         this.state = this.state ? false : true;
        //         this.render();
        //     },
        //     dataType: 'json'
        // })
        let p = new Promise((resolve, reject) => {
            this.running = true
            this.render()
            if (this.state) {
                let output = unfollowUser(this.user_id)
                resolve(output)
            } else {
                let output = followUser(this.user_id)
                resolve(output)
            }
        }).then(result => {
            this.running = false
            this.state = this.state ? false : true
            this.render();
        })
        
    }
}

module.exports = FollowToggle

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const {searchUsers} = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js")
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js")

class UsersSearch {
    constructor(obj) {
        let $obj = $(obj)
        this.$obj = $obj
        console.log($obj)
        this.$input = $('.user-search input')
        this.$ul = $('.user-search .users')
        console.log(this.$input)
        this.$input.on('input', (e) => {
            e.preventDefault()
            this.handleInput(e.target.value);
        })
    }

    renderResults(users) {
        this.$ul.empty()
        users.forEach((el) => {
            let $li = $(`<li><a href='/users/${el.id}'>${el.username}</a></li>`)
            let button = `<button class='follow-toggle' data-user-id = ${el.id} data-initial-follow-state = '${el.followed}'></button>`
            $li.append(button)
            console.log($li)
            this.$ul.append($li)
            
            // const a = new FollowToggle(button);
            // this.$ul.append(`<li><a href='/users/${el.id}'>${el.username}</a><button class='follow-toggle' data-user-id = ${el.id} data-initial-follow-state = '${el.followed}'></button></li>`)
        })
        $('.follow-toggle').each((idx, button) => {
            const a = new FollowToggle(button);
        })
    }

    handleInput(query) {
        let p = new Promise((resolve, reject) => {
            let output = searchUsers(query)
            resolve(output)
        }).then(result => {
            console.log(result)
            this.renderResults(result)
        })
    }

}

module.exports = UsersSearch

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
const UsersSearch = __webpack_require__(/*! ./users_search */ "./frontend/users_search.js")
$(() => {
    $('.follow-toggle').each((idx, button) => {
        const a = new FollowToggle(button);
    })
    $('.user-search').each((idx, search) => {
        console.log("created search box")
        const a = new UsersSearch(search);
    })
    
})
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map