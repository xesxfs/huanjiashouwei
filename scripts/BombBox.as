package
{
   import flash.events.Event;
   import flash.geom.Point;
   
   public class BombBox extends Bomb
   {
       
      
      private var openHeight:int;
      
      private var proyectiles:int;
      
      private var §_-Rb§:int;
      
      private var §_-8G§:int;
      
      public function BombBox(param1:int, param2:Point, param3:Point, param4:int, param5:int)
      {
         addFrameScript(0,this.frame1,19,this.frame20);
         super(param1,param2,param3);
         this.§_-Rb§ = param4;
         this.§_-8G§ = param5;
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.t0 = 0;
         this.t1 = 25;
         this.openHeight = 60;
         this.setLevelSettings();
         this.§_-Jy§ = (this.§_-6v§ - this.§_-FC§) / this.t1;
         this.§_-IR§ = (this.§_-5M§ - this.§_-Qu§ - this.g * this.t1 * this.t1 / 2) / this.t1;
         this.rotation = Math.random() * 100;
      }
      
      override protected function hit() : void
      {
         this.isActive = false;
         this.rotation = 0;
         this.§_-Fs§();
         this.gotoAndPlay("hit");
      }
      
      private function §_-Fs§() : void
      {
         var _loc1_:int = 10;
         var _loc2_:int = Math.floor(this.proyectiles * 0.5) * 7;
         var _loc3_:int = -_loc2_;
         var _loc4_:int = _loc2_;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 1;
         while(_loc4_ >= _loc3_)
         {
            if(this.§_-8G§ + _loc4_ < this.cRoot.paths[this.§_-Rb§][0].length)
            {
               if(Math.random() > 0.5)
               {
                  _loc7_ = _loc7_ * -1;
               }
               _loc5_ = this.cRoot.paths[this.§_-Rb§][0][this.§_-8G§ + _loc4_].x + Math.random() * 6 * _loc7_;
               _loc6_ = this.cRoot.paths[this.§_-Rb§][0][this.§_-8G§ + _loc4_].y + Math.random() * 6 * _loc7_;
               this.cRoot.bullets.addChild(new BombFragment(this.level,new Point(this.x,this.y),new Point(_loc5_,_loc6_),_loc1_));
            }
            _loc4_ = _loc4_ - 7;
            _loc1_ = _loc1_ + 1;
            if(this.§_-8G§ + _loc4_ >= 0)
            {
               continue;
            }
            break;
         }
      }
      
      private function setLevelSettings() : void
      {
         this.proyectiles = this.cRoot.gameSettings.engineers.bfg.clusterMinBombs + this.cRoot.gameSettings.engineers.bfg.clusterIncrementBombs * this.level;
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame20() : *
      {
         stop();
      }
   }
}
