'use client';
import React, { useState, useEffect } from 'react';
import styles from './Navbar.module.css';
import { Menu, X } from 'lucide-react';

export default function Navbar() {
  const [isScrolled, setIsScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 50);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const navLinks = [
    { name: 'INÍCIO', href: '#inicio' },
    { name: 'SOBRE NÓS', href: '#sobre' },
    { name: 'SERVIÇOS', href: '#servicos' },
    { name: 'CLIENTES', href: '#clientes' },
    { name: 'LOCALIZAÇÃO', href: '#localizacao' },
    { name: 'ORÇAMENTO', href: '#orcamento' },
  ];

  return (
    <nav className={`${styles.navbar} ${isScrolled ? styles.scrolled : ''}`}>
      <div className={`container ${styles.navContainer}`}>
        <div className={styles.logo}>
          <a href="#">
            <img src="/assets/images/logo.png" alt="ES Construtora" className={styles.logoImg} />
          </a>
        </div>

        {/* Desktop Menu */}
        <div className={styles.desktopMenu}>
          {navLinks.map((link) => (
            <a key={link.name} href={link.href} className={styles.navLink}>
              {link.name}
            </a>
          ))}
        </div>

        {/* Mobile Menu Toggle */}
        <button
          className={styles.mobileMenuToggle}
          onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
          aria-label="Toggle menu"
        >
          {mobileMenuOpen ? (
            <X size={28} color={isScrolled ? 'var(--color-primary)' : 'white'} />
          ) : (
            <Menu size={28} color={isScrolled ? 'var(--color-primary)' : 'white'} />
          )}
        </button>
      </div>

      {/* Mobile Menu */}
      <div className={`${styles.mobileMenu} ${mobileMenuOpen ? styles.mobileMenuOpen : ''}`}>
        <div className={styles.mobileMenuContent}>
          {navLinks.map((link) => (
            <a
              key={link.name}
              href={link.href}
              className={styles.mobileNavLink}
              onClick={() => setMobileMenuOpen(false)}
            >
              {link.name}
            </a>
          ))}
        </div>
      </div>
    </nav>
  );
}
