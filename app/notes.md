# // let comments = $("#comments");

# // let blogComments = function(){
# //   if (comments.length > 0){
# //     App.global_chat = App.cable.subscriptions.create(
# //       {
# //         channel: "BlogsChannel",
# //         blogId: comments.data("blog-id")
# //       },
# //       {
# //         connected: null,
# //         disconneted: null,
# //         received: function(data){
# //           comments.append(data.comment);
# //         },
# //         send_comment: function(comment, blogId){
# //           this.perform('send_comment', {
# //             comment: comment,
# //             blogId: blogId
# //           });
# //         },
# //       }
      
# //       );
# //   }
# //   $('#new_comment').submit(function(e){
# //     $this = $(this);
# //     textArea = $this.find('#comment_content');
# //     if ($.trim(textArea.val()).length > 1){
# //       // App.global_chat.send_comment(textArea.val(), comments.data('blog-id'));
# //       textArea.val("");
# //     }
# //     e.preventDefault();
# //     return false;
# //   });
# // };

# // $(document).ready(blogComments);

