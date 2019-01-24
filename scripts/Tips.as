package
{
   import com.adobe.utils.StringUtil;
   
   public class Tips
   {
       
      
      private var §_-1e§:XML;
      
      private var §_-RB§:String;
      
      public function Tips(param1:String, param2:String)
      {
         var § 0§:String = param1;
         var § 1§:String = param2;
         super();
         this.getMyU(§ 0§);
         if(§ 1§ == "")
         {
            return;
         }
         try
         {
            this.§_-1e§ = new XML(§ 1§);
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public function §_-ML§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-1e§.entry.length())
         {
            if(this.§_-Gc§(this.§_-1e§.entry[_loc1_]))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      private function getMyU(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1;
         if(StringUtil.beginsWith(_loc2_,"http://"))
         {
            _loc5_ = _loc2_.split("://");
            _loc3_ = _loc5_[1].split("/");
            _loc4_ = _loc3_[0];
         }
         else
         {
            _loc3_ = _loc2_.split("/");
            _loc4_ = _loc3_[0];
         }
         this.§_-RB§ = _loc4_;
      }
      
      private function §_-Gc§(param1:String) : Boolean
      {
         if(this.§_-RB§.indexOf(param1) == -1)
         {
            return false;
         }
         return true;
      }
   }
}
