-- 1) Profiles (user roles)

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  phone text,
  role text check (role in ('customer', 'restaurant', 'driver', 'admin')),
  restaurant_id uuid references public.restaurants(id),
  created_at timestamptz default now()
);


-- 2) Restaurants

create table if not exists public.restaurants (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  city text,
  address text,
  image_url text,
  is_open boolean default true,
  min_order_vnd int default 0,
  created_at timestamptz default now()
);


-- 3) Menu Items

create table if not exists public.menu_items (
  id uuid primary key default gen_random_uuid(),
  restaurant_id uuid not null references public.restaurants(id) on delete cascade,
  name text not null,
  description text,
  price_vnd int not null,
  category text,
  image_url text,
  is_available boolean default true,
  created_at timestamptz default now()
);


-- 4) Orders (master)

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  restaurant_id uuid not null references public.restaurants(id),
  customer_id uuid not null references public.profiles(id),
  driver_id uuid references public.profiles(id),
  status text check (status in (
    'new','accepted','preparing','ready',
    'assigned','picked','on_the_way','delivered','cancelled'
  )) default 'new',
  total_vnd int not null,
  delivery_fee_vnd int default 0,
  grand_total_vnd int not null,
  customer_address text,
  lat double precision,
  lng double precision,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);


-- 5) Order Items (detail)

create table if not exists public.order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  menu_item_id uuid not null references public.menu_items(id),
  name text not null,
  qty int not null,
  price_vnd int not null,
  total_vnd int not null
);
