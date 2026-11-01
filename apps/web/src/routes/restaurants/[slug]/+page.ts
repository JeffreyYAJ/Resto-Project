import { restaurants } from '$lib/mock-data';

export function load({ params }) {
  const restaurant = restaurants.find((item) => item.slug === params.slug) ?? restaurants[0];

  return {
    restaurant
  };
}
