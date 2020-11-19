import React from 'react'
import { render, screen } from '@testing-library/react'
import App from './App'

test('renders learn react link', () => {
  render(<App/>)
  const linkElement = screen.getByText(/changed on a feature branch/i)
  expect(linkElement).toBeInTheDocument()
})
