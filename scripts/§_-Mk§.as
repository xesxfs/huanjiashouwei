package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-Mk§ extends §_-Bx§
   {
       
      
      private var §_-TQ§:Boolean;
      
      private var §_-TH§:int = 130;
      
      private var §_-RA§:int = 0;
      
      private var §_-Nk§:int = 26;
      
      private var §_-0n§:int;
      
      public var §_-0B§:int;
      
      public function §_-Mk§(param1:Point, param2:Boolean = true)
      {
         super(param1);
         this.§_-0B§ = 0;
         this.gotoAndStop("idle");
         if(param2)
         {
            if(Math.random() > 0.5)
            {
               this.scaleX = -1;
            }
         }
         this.§_-RA§ = this.getRandom(0,this.§_-TH§);
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function onFrameUpdate() : void
      {
         if(!this.§_-TQ§)
         {
            this.§_-RA§++;
            if(this.§_-RA§ >= this.§_-TH§)
            {
               this.§_-TQ§ = true;
               this.§_-0n§ = 0;
               this.§_-RA§ = 0;
               this.gotoAndPlay("eating");
            }
            else
            {
               return;
            }
         }
         this.§_-0n§++;
         if(this.§_-0n§ >= this.§_-Nk§)
         {
            this.§_-TQ§ = false;
            this.gotoAndStop("idle");
         }
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "eatEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         Level(this.parent.parent).game.gameSounds.§_-8z§();
         this.§_-0B§++;
         if(this.§_-0B§ == 8)
         {
            this.cRoot.game.gameAchievement.killSheep(this.cRoot);
            Level(this.parent.parent).entities.addChild(new EnemyExplodeNormal(new Point(this.x,this.y),Level(this.parent.parent)));
            this.destroyThis();
         }
      }
      
      override protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOut);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,init);
         this.parent.removeChild(this);
      }
   }
}
