package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class SaveSlotDeleteButtonCancel extends SaveSlotDeleteButton
   {
       
      
      private var game:Game;
      
      public function SaveSlotDeleteButtonCancel(param1:Point, param2:MovieClip)
      {
         addFrameScript(0,this.frame1);
         super(param1,param2);
      }
      
      override protected function execAction() : void
      {
         this.slot.cancelDeleteSlot();
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
