<?php

namespace App\Notification;
use App\Entity\User;
use Twig\Environment;
use App\Entity\Contact;

class RegisterNotification
{
 /**
 * @var \Swift_Mailer
 */
 private $mailer;
 /**
 * @var Environment
 */
 private $renderer;
 public function __construct(\Swift_Mailer $mailer, Environment $renderer)
 {
 $this->mailer = $mailer;
 $this->renderer = $renderer;
 }

 public function notify(User $user)
 {
 $message = (new \Swift_Message('Message : Votre compte a bien été crée'))
 ->setFrom('Ecommerce@gmail.com')
 ->setTo($user->getEmail())
 ->setReplyTo('Ecommerce@gmail.com')
 ->setBody($this->renderer->render('email/register.html.twig', [
 'user' => $user
 ]), 'text/html');
 $this->mailer->send($message);
 }
}