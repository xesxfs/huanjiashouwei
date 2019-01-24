package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class §_-2w§ extends §_-Gt§
   {
       
      
      public var txt:TextField;
      
      public function §_-2w§(param1:MenuOptions, param2:Point, param3:String, param4:String)
      {
         super(param1,param2,param3,param4);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.txt.text = this.text;
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
      }
   }
}
