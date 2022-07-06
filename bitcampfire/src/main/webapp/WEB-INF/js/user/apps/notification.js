$(function() {
    
    var title = document.title.replace(/^\([0-9]+\) /, '');

    var notificationText = {
        'NOTED' : '이 <strong>{{articleTitle}}</strong> 에 댓글을 남겼습니다.',
        'NOTED_AFTER' : '도 게시물 <strong>{{articleTitle}}</strong> 에 댓글을 남겼습니다.',
        'ASSENTED_ARTICLE' : '이 회원님의 게시물 <strong>{{articleTitle}}</strong> 를 추천 하였습니다.',
        'ASSENTED_NOTE' : '이 게시물 <strong>{{articleTitle}}</strong> 에 작성하신 회원님의 댓글을 추천 하였습니다.'
    };

    $('#user-notification').on('shown.bs.popover', function () {
        $('#notification-popover').spin('small');
        $.ajax({
            url : contextPath+'/notification',
            dataType: 'json',
            success : function(data) {
                var notificationsHtml = '';

                toggleNotificationCount();

                $(data.notifications).each(function(i, notification) {
                    var senders = '', date, text = Mustache.render(notificationText[notification.type], notification);

                    senders += notification.sender.nickname+'님';

                    date = ' <span class="timeago pull-right" title="'+notification.lastUpdated+'">'+notification.lastUpdated+'</span>'

                    var read = new Date(notification.lastUpdated) < new Date(data.lastRead);

                    notificationsHtml += '<div class="notification-link clearfix '+ (read ? 'notification-accepted' : '')+'" data-article="'+notification.articleId+'" data-content="'+notification.contentId+'">'+senders+text+date+'</div>';
                });

                $('#notification-popover').html(notificationsHtml);

                $('#notification-popover .timeago').timeago();
            }
        });
    });

    $('#user-func').popover({
        container: 'body',
        title: '설정',
        placement: whereToPlacePopover,
        template: $('#setting-template').html(),
        html: true
    });

    $('#user-notification').popover({
        container: 'body',
        title: '알림',
        placement: whereToPlacePopover,
        template: $('#notification-template').html(),
        html: true
    });

    $(document).delegate('#notification-popover .notification-link', 'click' , function(e) {
        var data = $(this).data();
        location.href = contextPath+'/article/'+data.article+'?note='+data.content;
    });

    var notificationInterval = setInterval(function() {
        $.ajax({
            url: contextPath+'/notification/count.json',
            dataType: 'json',
            success: function(data) {
                toggleNotificationCount(data.count);
            },
            error: function() {
                clearInterval(notificationInterval);
            }
        });
    }, 1000 * 60 * 30);
    
    var toggleNotificationCount = function(count) {
        if(count) {
            $('#user-notification-count').html(count).show();
            $('#user-notification-icon').hide();
            document.title = '('+count+') ' + title;
        } else {
            $('#user-notification-count').html(0).hide();
            $('#user-notification-icon').show();
            document.title = title;
        }
    };
    
	$.get("/notification/count", function(data) {
		if(data.count) {
			toggleNotificationCount(data.count);
		}
	});
});