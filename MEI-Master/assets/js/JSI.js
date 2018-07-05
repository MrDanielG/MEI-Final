var JSI = null;
if(window.KOTLIN)
  JSI = window.KOTLIN;

function doFunc(func){
  try {
    func();
  } catch (e) {
    console.log(e);
  } finally {
    
  }
}
