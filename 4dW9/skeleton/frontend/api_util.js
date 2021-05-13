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