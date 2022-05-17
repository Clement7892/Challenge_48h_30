<?php

namespace App\Controller;


use App\Entity\Contact;
use App\Entity\Produit;
use App\Form\ContactType;
use App\Form\ProduitType;
use App\Entity\Commentaire;
use App\Form\RechercheType;
use App\Form\CommentaireType;
use App\Service\PanierService;
use App\Repository\ProduitRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Notification\ContactNotification;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class EcommerceController extends AbstractController
{
    #[Route('/ecommerce', name: 'home_ecommerce')]
    public function home(ProduitRepository $repo,Request $request): Response
    {
        $form = $this->createForm(RechercheType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $data = $form->get('recherche')->getData();
            $produits = $repo->getProduitsByName($data);
        }
        else{
            $produits = $repo->findBy([], ['nom' =>'ASC']);
        }
        
        return $this->render('ecommerce/home.html.twig',[
            'produits' => $produits,
            'formRecherche' => $form->createView(),
        ]);

    }
    #[Route('/ecommerce/show/{id}', name: 'show_produit')]
    public function show(Produit $produit, Request $request, EntityManagerInterface $manager): Response
    {
        $commentaire = new Commentaire;
        $commentaire->setCreatedAt(new \DateTime());
        $commentaire->setUser($this->getUser());
        $commentaire->setProduit($produit);

        $form = $this-> createForm(CommentaireType::class, $commentaire);
        $form->handleRequest($request);
        dump($commentaire);
        if ($form->isSubmitted() && $form->isValid())
        {
            $manager->persist($commentaire);
            $manager->flush();
            return $this->redirectToRoute('show_produit',[
                'id' => $produit->getId(),

            ]);

        }
        return $this->render('ecommerce/show.html.twig',[
            'produit' => $produit,
            'formCommentaire' => $form->createView(),
        ]);
    }
    #[Route('ecommerce/new', name: 'create_produit')]
    #[Route('ecommerce/edit/{id}', name: 'edit_produit')]
    public function create(Produit $produit = null,Request $request,EntityManagerInterface $manager): Response
    {
        if(!$this->getUser()){
            return $this->redirectToRoute('home_ecommerce');
        }
        if(!$produit){
            $produit = new Produit;
            $produit->setUpdatedAt(new \DateTime());
            $produit->setUser($this->getUser());
        }else {

            if(!($this->getUser()->getUserIdentifier() == $produit->getUser()->getUserIdentifier())){
                return $this->redirectToRoute('home_ecommerce');
            }
        }
            $form = $this-> createForm(ProduitType::class, $produit);
            $form->handleRequest($request);
            dump($produit);
            
            
            
            if ($form->isSubmitted() && $form->isValid())
            {
                $manager->persist($produit);
                $manager->flush();
                return $this->redirectToRoute('show_produit',[
                    'id' => $produit->getId(),
    
                ]);
    
            }
    
            return $this->render('ecommerce/form.html.twig', [
               'editMode' => $produit->getId() !== null,
               'formProduit' => $form->createView(),
               'produit' => $produit,
            ]);
            
    }
    #[Route('/ecommerce/profil', name: 'profil_ecommerce')]
    public function profil() : Response
    {
        return $this->render('ecommerce/profil.html.twig', [
        ]);
    }

    #[Route('/ecommerce/contact', name: 'contact_ecommerce')]
    public function contact(Request $request, EntityManagerInterface $manager,ContactNotification $notification) : Response
    {
        $contact = new Contact();
        $contact->setCreatedAt(new \DateTime());
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
        $notification->notify($contact);
        $this->addFlash('success', 'Votre Email a bien été envoyé');
        $manager->persist($contact); // on prépare l'insertion
        $manager->flush(); // on execute l'insertion
        return $this->redirectToRoute('contact_ecommerce');
        }
        return $this->render("ecommerce/contact.html.twig", [
        'formContact' => $form->createView()
        ]);
    }

    #[Route('/ecommerce/event/{id}', name: 'see_event')]
    public function event(Produit $produit, Request $request, EntityManagerInterface $manager): Response
    {
        $commentaire = new Commentaire;
        $commentaire->setCreatedAt(new \DateTime());
        $commentaire->setUser($this->getUser());
        $commentaire->setProduit($produit);

        $form = $this-> createForm(CommentaireType::class, $commentaire);
        $form->handleRequest($request);
        dump($commentaire);
        if ($form->isSubmitted() && $form->isValid())
        {
            $manager->persist($commentaire);
            $manager->flush();
            return $this->redirectToRoute('see_event',[
                'id' => $produit->getId(),

            ]);

        }
        return $this->render('ecommerce/event.html.twig',[
            'produit' => $produit,
            'formCommentaire' => $form->createView(),
        ]);
    }
    #[Route('/ecommerce/delete/{id}', name: 'delete_produit')]
    public function delete($id, PanierService $cs)
    {
        $cs -> remove($id);
        return $this -> redirectToRoute('profil_ecommerce');
    }

}
