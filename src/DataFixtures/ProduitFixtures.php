<?php

namespace App\DataFixtures;

use App\Entity\User;
use App\Entity\Produit;
use App\Entity\Categorie;
use App\Entity\Commentaire;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;

class ProduitFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = \Faker\Factory::create('fr_FR');

        for ($l=1; $l < mt_rand(5,10) ; $l++) { 
            $user = new User();

            $user->setEmail($faker->email())
            ->setUsername($faker->username())
            ->setPassword($faker->password())
            
        ;
        $manager->persist($user);
        }

        for ($i=0; $i <= 3 ; $i++) { 
            $categorie = new Categorie;
            $categorie->setTitre($faker->sentence(3));

            $manager->persist($categorie);
        
            for ($j=1; $j <= mt_rand(4,6); $j++){

                $produit = new Produit;
                $contenu = '<p>' . join('</p><p>', $faker->paragraphs(5)) . '</p>';


                $produit->setNom($faker->sentence())
                        ->setDescription($contenu)
                        ->setPrix(mt_rand(4,6))
                        ->setImage("http://picsum.photos/250/150")
                        ->setCategorie($categorie)
                        ->setUser($user)
                        ->setUpdatedAt(new \DateTime());

                $manager->persist($produit);





            for ($k=1; $k < mt_rand(5,10); $k++) { 
                $commentaire = new Commentaire;

                $content =  '<p>' . join('</p><p>', $faker->paragraphs(2)) . '</p>';

                $now = new \DateTime();

                $commentaire->setUser($user)
                    ->setContenu($content)
                    ->setCreatedAt($now)
                    ->setProduit($produit);

                $manager->persist($commentaire);
    

                
            }
            }
        }
        $manager->flush();
    }
    }
