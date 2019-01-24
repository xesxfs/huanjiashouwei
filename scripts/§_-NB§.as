package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-NB§ extends MovieClip
   {
       
      
      protected var §_-4i§:Boolean;
      
      protected var §_-31§:int;
      
      protected var §_-PH§:int;
      
      protected var isActive:Boolean;
      
      protected var fadeTime:int;
      
      protected var fadeTimeCounter:int;
      
      protected var level:int;
      
      protected var maxProjectiles:int;
      
      protected var §_-6M§:int;
      
      protected var §_-T3§:int;
      
      protected var spawnTime:int;
      
      protected var §_-0i§:int;
      
      protected var §each §:int;
      
      protected var §_-SY§:int;
      
      protected var cRoot:Level;
      
      public function §_-NB§(param1:Point, param2:int, param3:Level)
      {
         super();
         addFrameScript(5,this.frame6,29,this.frame30);
         this.cRoot = param3;
         this.isActive = true;
         this.§_-4i§ = false;
         this.x = param1.x;
         this.y = param1.y;
         this.level = param2;
         this.maxProjectiles = this.cRoot.gameSettings.heroes.heroKing.catapultRocks + this.cRoot.gameSettings.heroes.heroKing.catapultRocksIncrement * param2;
         this.spawnTime = 6;
         this.§_-T3§ = 0;
         this.fadeTime = 24;
         this.fadeTimeCounter = 0;
         this.§_-SY§ = -180;
         if(this.x > 350)
         {
            this.§each § = 350;
         }
         else
         {
            this.§each § = -350;
         }
         this.§_-31§ = 10;
         this.§_-PH§ = 0;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-4i§)
         {
            this.§_-PH§++;
            if(this.§_-PH§ >= this.§_-31§)
            {
               this.isActive = false;
               this.§_-4i§ = false;
               this.gotoAndPlay("goOut");
            }
            return;
         }
         if(!this.isActive)
         {
            this.fadeTimeCounter++;
            if(this.fadeTimeCounter >= this.fadeTime)
            {
               this.destroyMe();
            }
            return;
         }
         if(this.§_-0i§ < this.spawnTime)
         {
            this.§_-0i§++;
            return;
         }
         this.§_-9v§();
         if(this.§_-6M§ == this.maxProjectiles)
         {
            this.§_-4i§ = true;
         }
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "idle":
               break;
            case "goOutEnd":
               break;
            default:
               this.play();
         }
      }
      
      protected function §_-9v§() : void
      {
         this.§_-0i§ = 0;
         this.§_-6M§++;
         var _loc1_:int = Math.random() * 30 + 15;
         var _loc2_:int = _loc1_ * this.cRoot.gameSettings.rangeRatio;
         this.cRoot.bullets.addChild(new §_-3M§(this.level,new Point(this.x + this.§each §,this.y + this.§_-SY§),this.getRockDestination(this.§_-T3§,_loc1_,_loc2_)));
         this.§_-T3§ = this.§_-T3§ + 70;
         if(this.§_-T3§ >= 360)
         {
            this.§_-T3§ = this.§_-T3§ - 360;
         }
      }
      
      protected function getRockDestination(param1:int, param2:int, param3:int) : Point
      {
         var _loc4_:* = new Ellipse(this.x - param2 / 2,this.y - param3 / 2,param2,param3);
         return _loc4_.getPointOfDegree(param1);
      }
      
      protected function destroyMe() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame6() : *
      {
         stop();
      }
      
      function frame30() : *
      {
         stop();
      }
   }
}
