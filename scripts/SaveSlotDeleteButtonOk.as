package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class SaveSlotDeleteButtonOk extends SaveSlotDeleteButton
   {
       
      
      private var game:Game;
      
      public function SaveSlotDeleteButtonOk(param1:Point, param2:MovieClip)
      {
         addFrameScript(0,this.frame1);
         super(param1,param2);
      }
      
      override protected function execAction() : void
      {
         this.slot.confirmDeleteSlot();
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
