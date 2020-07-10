// $(document).on('turbolinks:load', function() {
//   $fileField = $('#upload-image')

//   $($fileField).on('change', $fileField, function(e) {

//       file = e.target.files[0]
//       reader = new FileReader(),
//       $preview = $(".movie-group-form__choice");

//       reader.onload = (function(file) {
//         return function(e) {
//           $preview.empty();
//           $preview.append($('<video>').attr({
//             src: e.target.result,
//             width: "45%",
//             height: "110px",
//             class: "preview-image",
//             autoplay: "autoplay",
//             loop: "loop",
//             playsinline: "true",
//             title: file.name
//           }));
//         };
//       })(file);
//       reader.readAsDataURL(file);
//     });
//   });
