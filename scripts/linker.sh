#! /bin/sh

# /scripts/linker.sh

#### AMAZON ####
# update amazon store files add cart URL with AID number 
find ./build/src/store/model/amazon*.js \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i '/cartUrl/s/Quantity.1=1/&\&tag=randoprojects-20\&AssociateTag=randoprojects-20/'

# update amazon store URL with AID number 
# ex:( 'https://www.amazon.com/dp/B08P2HBBLX' -> 'https://www.amazon.com/dp/B08P2HBBLX?tag=randoprojects-20' )
find ./build/src/store/model/amazon*.js \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i '/url:/s/dp\/[^\/'\'']*/&?tag=randoprojects-20/'

### ASUS ###
# update asus store URL with AID number 
# ex:( 'https://store.asus.com/us/item/202009AM150000004' -> 'https://store.asus.com/us/item/202009AM150000004?affiliate_id=QdK0G0s7sh&referring_service=link' )
find ./build/src/store/model/asus.js \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i '/url:/s/item\/[^\/'\'']*/&?affiliate_id=QdK0G0s7sh\&referring_service=link/'

### NEWEGG US ####
# Change cart URL with ID number
find ./build/src/store/model/newegg.js \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i '/cartUrl/s+https://secure.newegg.com/Shopping/AddtoCart.aspx?Submit=ADD\&ItemList=+https://click.linksynergy.com/deeplink?id=hTqnyMYQLXo\&mid=44583\&murl=https%3A%2F%2Fsecure.newegg.com%2FShopping%2FAddtoCart.aspx%3FSubmit%3DADD%26ItemList%3D+'

#### BESTBUY ####
# ex: ('https://api.bestbuy.com/click/-/6439300/pdp' -> 'https://api.bestbuy.com/click/-/6439300/pdp?IPID=2602688')
find ./build/src/store/model/bestbuy*.js \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i '/url:/s/pdp/&?IPID=2602688/'

# ex: ('https://api.bestbuy.com/click/-/6439300/cart' -> 'https://api.bestbuy.com/click/-/6439300/cart?IPID=2602688')
find ./build/src/store/model/bestbuy*.js \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i '/cartUrl:/s/\/cart/&?IPID=2602688/'