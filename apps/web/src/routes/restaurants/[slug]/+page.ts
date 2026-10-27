import { restaurants } from '../../../lib/mock-data';

export function load({ params }: { params: { slug: string } }) {
  const restaurant = restaurants.find((item: { slug: string }) => item.slug === params.slug) ?? restaurants[0];

  return {
    restaurant
  };
}
