'use client';
import React from 'react';
import styles from './FloatingActionButtons.module.css';
import { Instagram, Mail } from 'lucide-react';

export default function FloatingActionButtons() {
  return (
    <div className={styles.fabContainer}>
      <a 
        href="https://www.instagram.com/esconstrutorasilva?igsh=OXQ2c2RobDU4Z2cw" 
        target="_blank" 
        rel="noopener noreferrer"
        className={styles.fab}
        aria-label="Instagram"
      >
        <Instagram size={24} color="#E1306C" />
      </a>
      
      <a 
        href="mailto:adm@construrota.net?subject=Orçamento&body=Olá, gostaria de saber mais sobre os serviços." 
        className={styles.fab}
        aria-label="E-mail"
      >
        <Mail size={24} color="#007bff" />
      </a>
    </div>
  );
}
