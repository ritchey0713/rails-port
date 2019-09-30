// let options = {
//     strings: [
//       "Hello",
//       "Test"
//     ],
//     typeSpeed: 35
//   };
  
//   var typed = new Typed('#element', options);

let typed =  $(function(){
    $("#element").typed({
      strings: ["Develop.", "Design.", "Chat.", "Explore", "Inquire", "Grow"],
      typeSpeed: 30,
      backSpeed: 20,
      backDelay: 500,
      // loop
      loop: true,
      loopCount: false,
      showCursor: true,
      cursorChar: "|",
    });
  });
  

