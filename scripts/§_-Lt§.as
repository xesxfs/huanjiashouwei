package
{
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-Lt§ extends Bolt
   {
       
      
      public function §_-Lt§(param1:Point, param2:Enemy, param3:int)
      {
         addFrameScript(1,this.frame2,10,this.frame11);
         super(param1,param2,param3);
      }
      
      override protected function playPop() : void
      {
         if(this.target != null && this.target.isDead)
         {
            this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"zap"));
         }
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playBolt();
         this.maxAceleration = 10;
         this.setLevelSettings();
         this.moveMe(true);
      }
      
      function frame2() : *
      {
         gotoAndPlay("travel");
      }
      
      function frame11() : *
      {
         stop();
      }
   }
}
