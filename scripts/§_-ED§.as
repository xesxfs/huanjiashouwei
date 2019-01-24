package
{
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class §_-ED§ extends §_-Gt§
   {
       
      
      public var txt:TextField;
      
      public function §_-ED§(param1:MenuOptions, param2:Point, param3:String, param4:String)
      {
         super(param1,param2,param3,param4);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.txt.text = this.text;
      }
   }
}
